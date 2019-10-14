using System;
using System.IO;
using System.Linq;
using System.Diagnostics;
using System.Threading.Tasks;
using System.Security.Cryptography;


public class Program {
    public static void Main(string[] args) {
        Console.WriteLine("Hello, world!");
        Console.WriteLine(Environment.GetEnvironmentVariable("username"));
        Console.ReadKey();
    }
}