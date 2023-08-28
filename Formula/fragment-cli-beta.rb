require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3401.0.0-darwin-x64.tar.gz"
    sha256 "8f28900ca9104d98402d1ccd0d12eb0598e7dd31d6cf8745b5d446451150438b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3401.0.0-darwin-arm64.tar.gz"
      sha256 "4d07cc3618603efa312f3bb3d7847bda1ee31575412651f45999fc6652401fce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3401.0.0-linux-x64.tar.gz"
    sha256 "e9683e3f0696578790714de6c8aa6a68bd4f696a58756541bf3f844de901b431"
  end
  version "3401.0.0"
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
