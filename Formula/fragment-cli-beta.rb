require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3782.0.0-darwin-x64.tar.gz"
    sha256 "a9b794aa6120aa39a57c0cd8303c3cd3722980d4b291c4f7b3467ab10a424f87"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3782.0.0-darwin-arm64.tar.gz"
      sha256 "f3074736b5ade60d37ef7bb8a279ffbc2829323b29cde582ef2bacfa263c22b2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3782.0.0-linux-x64.tar.gz"
    sha256 "dce83ccb371ec7fa9873aece7b45976c12ce9b6a9ba1f7cbdaf9c3eac75875bf"
  end
  version "3782.0.0"
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
