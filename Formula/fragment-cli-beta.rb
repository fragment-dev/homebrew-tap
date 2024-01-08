require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4287.0.0-darwin-x64.tar.gz"
    sha256 "3c4d98e79e5b2c1588805461c547f1ba2a95b13b7ae1d7ee6b817149d4860426"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4287.0.0-darwin-arm64.tar.gz"
      sha256 "0cb7ef06f8d9b1c785601cbe7f282436a3ee7613aaf0980f19e95b2e32c3b3f0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4287.0.0-linux-x64.tar.gz"
    sha256 "d27b050113956ec7d06391577856a9cb68ed8e7f53b10bb3ed1aae0f5855e44a"
  end
  version "4287.0.0"
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
