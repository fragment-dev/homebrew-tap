require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2235.0.0-darwin-x64.tar.gz"
    sha256 "22e49ba2ff384264b0aadf10a5743c24a27e38d2bb9ce13841088e7c0facb0b5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2235.0.0-darwin-arm64.tar.gz"
      sha256 "12c429f064e591e0a8e7754414d6afce1b0b54b0b9f083b33dee64a03541332b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2235.0.0-linux-x64.tar.gz"
    sha256 "3ca17eefe77b91b53f890f3cc03d510e4b4561d3caa8d9baa1a7db7d132c0707"
  end
  version "2235.0.0"
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
