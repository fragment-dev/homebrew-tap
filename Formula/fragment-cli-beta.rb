require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5471.0.0-darwin-x64.tar.gz"
    sha256 "54363796ff7c00e37eb4f9107249880c4e54e1e5949386309580d44db0b52c15"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5471.0.0-darwin-arm64.tar.gz"
      sha256 "41c2cb483e58a8c3b05f6f583b1f495d03cd0c50e550120921aafcd9c6b80070"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5471.0.0-linux-x64.tar.gz"
    sha256 "351a4ee4b7a2b31ec71c025add4bd531ddef6340937d4586791d2a517afbd6d8"
  end
  version "5471.0.0"
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
