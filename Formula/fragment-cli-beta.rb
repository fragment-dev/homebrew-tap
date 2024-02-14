require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4559.0.0-darwin-x64.tar.gz"
    sha256 "3acd5b484b6787f16f1a5636b63a924ae88abd86dcae1859e14367f59753f68b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4559.0.0-darwin-arm64.tar.gz"
      sha256 "19e3a158e26622ed8fcfb8887d8287a2ac29054b82d855b373ecf551f94c46f4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4559.0.0-linux-x64.tar.gz"
    sha256 "cde6d03c7ded0d6babe6ad8a73962892e86dc7fa77bf0988042ab139e1da5dff"
  end
  version "4559.0.0"
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
