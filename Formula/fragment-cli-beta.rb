require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3201.0.0-darwin-x64.tar.gz"
    sha256 "6986f6e7e0b98a4258cc79369c3b77276c3deb885ad2ff406340aa6da388dca2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3201.0.0-darwin-arm64.tar.gz"
      sha256 "059c38534eb6c245aaf05334c227f1bc703a8f7b17acadf14c6529209b894e99"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3201.0.0-linux-x64.tar.gz"
    sha256 "7dc609acb166a8372d25a82330c6d03e64c305353f70fd67e414c37499a0ef77"
  end
  version "3201.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
