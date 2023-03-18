require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2240.0.0-darwin-x64.tar.gz"
    sha256 "76937ebc1bc8e52c81c6c8f0499477479d4a3f169d8a02905592863fa2ec9928"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2240.0.0-darwin-arm64.tar.gz"
      sha256 "284aff44c40c6f509ce30d0f2488643bb23f3d36c3a2a2786db0b2cd6b4e05e6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2240.0.0-linux-x64.tar.gz"
    sha256 "ecbb748944eee2de61bf935e1bc526fb296c3c7f69da48a97ab8f7831124291f"
  end
  version "2240.0.0"
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
