require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2503.0.0-darwin-x64.tar.gz"
    sha256 "9924437b219a12ccc84674acb058bac1e9a1449452886da628100ec4a025d8a3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2503.0.0-darwin-arm64.tar.gz"
      sha256 "56d497c859a90f933d4098490139df593cb0c89e2b6212b40e285e70f3cd94a1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2503.0.0-linux-x64.tar.gz"
    sha256 "39967bc83750655950390ef5c60495bc225ee1418de4efa0e50d28d73aafc256"
  end
  version "2503.0.0"
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
