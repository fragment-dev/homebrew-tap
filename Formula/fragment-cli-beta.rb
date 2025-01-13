require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6077.0.0-darwin-x64.tar.gz"
    sha256 "24be797369ca49022fe4830f1094564dcea0cc1708f51f19de4d4edb426112ac"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6077.0.0-darwin-arm64.tar.gz"
      sha256 "35f46824b0aa2aac309db6ce67f1c65a1e5bad1d3b7d9e88e8a71c405fba9ca3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6077.0.0-linux-x64.tar.gz"
    sha256 "fcbb4ce8fc170fbbcdea7ce046442be81f7a88f42881a4b5c83575912e71facc"
  end
  version "6077.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
