require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5458.0.0-darwin-x64.tar.gz"
    sha256 "33d536a72d865fc6bac549d85da289e9fb1dc9f77ed3fcf6c344b6163fc0786e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5458.0.0-darwin-arm64.tar.gz"
      sha256 "0669a4cc563c747274194ff796686f5e81a7038db64007779ea9f0d7af366c6b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5458.0.0-linux-x64.tar.gz"
    sha256 "d5688023702cb851ff6e6431dad030d2709e8b3dc0a6a2024eb12e93199ae954"
  end
  version "5458.0.0"
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
