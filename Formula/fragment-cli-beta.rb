require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4479.0.0-darwin-x64.tar.gz"
    sha256 "3d7e281fd11c811991f428995e31df4bca75714870d8f7f745c3b6f9fecd651b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4479.0.0-darwin-arm64.tar.gz"
      sha256 "9ecafb37f0929b1ac35fd29f77185853108b0b245762c70bbcd470052cb21cd5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4479.0.0-linux-x64.tar.gz"
    sha256 "19eae6f8a96b680ec6db9da1278c754ef40c4851534d3af1224967ac5c51d46e"
  end
  version "4479.0.0"
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
