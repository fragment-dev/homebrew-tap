require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3958.0.0-darwin-x64.tar.gz"
    sha256 "5b7ab7672d6c024db93bb9f56dddf60d83e3acab8985d12de851701cb5eda5b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3958.0.0-darwin-arm64.tar.gz"
      sha256 "0f076b69c522e72f0067a6688f5d1709862d3c7f14e35879fd41c66e668d9ee8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3958.0.0-linux-x64.tar.gz"
    sha256 "0d24f543baf2e742a939368472d5bc9e6f2f63263b0fb002f3821f02b5f02aec"
  end
  version "3958.0.0"
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
