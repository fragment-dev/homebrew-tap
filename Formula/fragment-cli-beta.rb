require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3879.0.0-darwin-x64.tar.gz"
    sha256 "5402caf3cdaad7df0da2906e2fd07fdbe038c7e4b2120c92764305d56636b2de"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3879.0.0-darwin-arm64.tar.gz"
      sha256 "9727fc7987c735e64091bda31b55ebe2aa3e571aa88d36f213a27ebcb928674f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3879.0.0-linux-x64.tar.gz"
    sha256 "b360ec38b371cdb2d4a1ab7dbe3be263773bb10d8ff0aa4f139bfb6674befcb6"
  end
  version "3879.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
