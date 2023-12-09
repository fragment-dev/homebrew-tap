require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4125.0.0-darwin-x64.tar.gz"
    sha256 "91bdd06b6847b7aa90345048fa20c317db0bfef84924e3b4c0d18c67b9eb1bab"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4125.0.0-darwin-arm64.tar.gz"
      sha256 "46aa5419b3e954f94c00a3375f321bc847550b781f8041335732e764432a7e60"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4125.0.0-linux-x64.tar.gz"
    sha256 "e967d79e6c0d07d5ff8f96230244ccb14af020c75b4712c902648c1b5bc77c58"
  end
  version "4125.0.0"
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
