require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4406.0.0-darwin-x64.tar.gz"
    sha256 "5b110a0477e40e903a6f68257347abf4b36c6d5e2e9644cff21409b9e64e8f40"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4406.0.0-darwin-arm64.tar.gz"
      sha256 "ca0766044fa1ffbfb107f83660e66a72544fd006c4f1157765edf43704bc3e8f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4406.0.0-linux-x64.tar.gz"
    sha256 "f064874aacf1872d3db9afb110d9bf32d3ff658dc4bcab3245f0954b0e3b7c27"
  end
  version "4406.0.0"
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
