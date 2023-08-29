require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3425.0.0-darwin-x64.tar.gz"
    sha256 "384d9fae23c1ea813067dac636c2c95dce67a3aca6bea464153813bb8649bd25"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3425.0.0-darwin-arm64.tar.gz"
      sha256 "9c3bc2c69f5df2b64466608406832fd242b8a2c73c7b1d08fa96d336cda8a78e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3425.0.0-linux-x64.tar.gz"
    sha256 "9356b349847371921252b48e1425701a37bc01a6e74b45514e1a2bfdf07d8619"
  end
  version "3425.0.0"
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
