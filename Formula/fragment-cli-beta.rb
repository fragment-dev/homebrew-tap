require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2393.0.0-darwin-x64.tar.gz"
    sha256 "f297d3a23f5dca0f17d46e7cba87ea930f00707b14a4bcd59cf614715a9629f1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2393.0.0-darwin-arm64.tar.gz"
      sha256 "79f592915897b5088dfd5f30d975e481db670099d7a5815673961037c9316c4d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2393.0.0-linux-x64.tar.gz"
    sha256 "12dafb692bb40f072dda2024bdd33e61c747aeac801da59854912775e2c5599f"
  end
  version "2393.0.0"
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
