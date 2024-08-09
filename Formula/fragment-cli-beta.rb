require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5487.0.0-darwin-x64.tar.gz"
    sha256 "b5dc097347f4fd6424e87cf8afdbab7625a50d1633bcf1685c31ed7ca31eb101"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5487.0.0-darwin-arm64.tar.gz"
      sha256 "491a158f65b9fe12758603af37a0a1ebb261dadefecd3e0304e94dceac50919a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5487.0.0-linux-x64.tar.gz"
    sha256 "f78094eab66772285e4085ddc9c733adbe3a86ed12bc709b9289f29ce6e4af30"
  end
  version "5487.0.0"
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
