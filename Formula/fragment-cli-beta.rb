require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4843.0.0-darwin-x64.tar.gz"
    sha256 "defbbc53bbede3c8e6ee721fa319f7b0256477bac0eb8eabd5f48f05efe7c6af"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4843.0.0-darwin-arm64.tar.gz"
      sha256 "8c83ff9efda66558fa40c3e14231f9e75096efd1d3be879be8b17eb1d6bfb49b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4843.0.0-linux-x64.tar.gz"
    sha256 "824cd69ec2916eddd23a9ade33f9f433593f4aabd59e0204fd729762dda95988"
  end
  version "4843.0.0"
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
