require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4419.0.0-darwin-x64.tar.gz"
    sha256 "510441b37e5fa68a56bef0ff2a96f4f0332642a42e4ab2b8184ba26dbeea41c9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4419.0.0-darwin-arm64.tar.gz"
      sha256 "31f75f12bbb5e718c502c06623d89881b8ebbbaaa58aec5f75779ef2e3de9d15"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4419.0.0-linux-x64.tar.gz"
    sha256 "ca59c9535e29d3a0271e1a733eb2c8f641a5b8aa711efaebcadbeda91e8c81ee"
  end
  version "4419.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
