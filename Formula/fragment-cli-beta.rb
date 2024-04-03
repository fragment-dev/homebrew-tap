require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4845.0.0-darwin-x64.tar.gz"
    sha256 "29a4c558eb8367bd57f931aa29a7ffa8b6375ab3afbe427e2f7bbaacb7bb50ef"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4845.0.0-darwin-arm64.tar.gz"
      sha256 "42b350f7ca894a0640ff7c10f94354f6819d0252b93ae25ed3093957f1db519e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4845.0.0-linux-x64.tar.gz"
    sha256 "7605646d74aaa38b211d77b17befaa6c72c357b1acbaef379eae3bcad6313ea2"
  end
  version "4845.0.0"
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
