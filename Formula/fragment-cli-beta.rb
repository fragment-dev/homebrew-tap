require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4135.0.0-darwin-x64.tar.gz"
    sha256 "73e6d09d38a0199286dcd28e2d8198dbabd9ff051afeb2dcec6e0effe769c9c0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4135.0.0-darwin-arm64.tar.gz"
      sha256 "6052302c9e7560d0d42bf00061671937eebb7858432cc9b46d9559b1515f76c2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4135.0.0-linux-x64.tar.gz"
    sha256 "59e2f43555649e57600ac4a56373b3317800cc7796ea097f9615e409cffa8daf"
  end
  version "4135.0.0"
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
