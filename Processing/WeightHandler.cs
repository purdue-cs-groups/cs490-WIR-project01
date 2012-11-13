﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

namespace BillboardAnalyzer.Processing
{
    public class WeightHandler
    {
        private static Index _index;

        public static string Process(Index index, string[] query)
        {
            _index = index;

            // initialize the rank dictionary
            Dictionary<int, double> rank = new Dictionary<int, double>();
            foreach (KeyValuePair<int, string> document in _index.documents)
                rank.Add(document.Key, 0.0);

            // rank the terms in the query
            Dictionary<string, double> queryWeight = new Dictionary<string, double>();

            int weight = 1;
            foreach (string term in query.Reverse())
            {
                queryWeight.Add(term, weight);
                weight++;
            }

            // loop through all of the terms in the index
            foreach (KeyValuePair<int, string> term in _index.terms)
            {
                // only process the terms that are being queried
                if (query.Contains(term.Value) == true)
                {
                    // loop though all of the documents in the index
                    foreach (KeyValuePair<int, string> document in _index.documents)
                    {
                        int frequency = Occurrences(document.Value, term.Value);

                        // only process the documents that contain this term
                        if (frequency > 0)
                            rank[document.Key] = rank[document.Key] + ComputeWeight(document.Key, term.Key, frequency, queryWeight[term.Value]);
                    }
                }
            }

            // calculate the results
            StringBuilder sb = new StringBuilder();
            foreach (KeyValuePair<int, double> result in rank.OrderByDescending(z => z.Value))
            {
                sb.AppendLine(result.Key.ToString() + " " + result.Value.ToString());
            }

            return sb.ToString();
        }

        private static double ComputeWeight(int documentId, int termId, int documentTermFrequency, double queryTermWeight)
        {
            int length = _index.GetDocumentLength(documentId);
            int averageLength = _index.GetAverageDocumentLength();
            int total = _index.GetDocumentCount();
            int contains = _index.GetNumberOfDocumentsContaining(termId);

            return (documentTermFrequency / (documentTermFrequency + 0.5 + (1.5 * length / averageLength))) * Math.Log10(((double)total - ((double)contains + 0.5)) / ((double)contains + 0.5)) * ((8 + queryTermWeight) / (7 + queryTermWeight));
        }

        private static int Occurrences(string document, string term)
        {
            int count = 0;

            int index = 0;
            while ((index = document.IndexOf(term, index)) != -1)
            {
                index += term.Length;
                count++;
            }

            return count;
        }
    }
}