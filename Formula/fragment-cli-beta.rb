require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5813.0.0-darwin-x64.tar.gz"
    sha256 "11f2285943d542b68d0b9f46738d34987d507d0570d9377dc2224d13fd0b7c6f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5813.0.0-darwin-arm64.tar.gz"
      sha256 "e68d96e05913965d65d173c2e3ffae8e6be4953e0ebd1522c599d8a491527470"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5813.0.0-linux-x64.tar.gz"
    sha256 "47da8e1e457d8779805d96331d0aa016ba3a84d5a59ddb1478feae9c239a19a2"
  end
  version "5813.0.0"
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
