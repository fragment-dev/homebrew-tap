require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5259.0.0-darwin-x64.tar.gz"
    sha256 "fa30a1d0d3ccc64dc7519bb49cc4643ec37a75bed63576b53561b794b48d923a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5259.0.0-darwin-arm64.tar.gz"
      sha256 "665ffaef8d285c67fea8307bf69207eec14478783d978b00469293bd83e660f4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5259.0.0-linux-x64.tar.gz"
    sha256 "a86d868e0ba19f04fac4e3761e48c41f7efef65d59cd684d4a18fb5b8a2bd6ec"
  end
  version "5259.0.0"
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
