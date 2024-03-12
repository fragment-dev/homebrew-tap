require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4750.0.0-darwin-x64.tar.gz"
    sha256 "8c77baef55d5ccd2348ac7922c034f22c6a45c4416eb6abdf2f73b7836cfd365"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4750.0.0-darwin-arm64.tar.gz"
      sha256 "8ea415ba895f5cec287c893c4cb3a14a1fd752ac05914d78c045936c149a414e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4750.0.0-linux-x64.tar.gz"
    sha256 "af2fab3627408bda5b419848affc6ca78f7a3373ee4ecc262d031a0deb755541"
  end
  version "4750.0.0"
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
