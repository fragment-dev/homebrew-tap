require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4013.0.0-darwin-x64.tar.gz"
    sha256 "233ec947b82414a7b2120ed1d9842ae158781510375a955180d2a39f1f0226aa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4013.0.0-darwin-arm64.tar.gz"
      sha256 "e9961bc1ee5ea64375802c66a31a33272be367864b487e9a8f5a70a01a858897"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4013.0.0-linux-x64.tar.gz"
    sha256 "fad35f0cb3836da96452f900921ab1aebe4c4bbafc272734adc9f527c0eaa00d"
  end
  version "4013.0.0"
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
