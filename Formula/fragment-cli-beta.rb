require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2599.0.0-darwin-x64.tar.gz"
    sha256 "39441f8c75fc1989709b21a4c30393481f0dfda9870711bf665da9405a5bfd62"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2599.0.0-darwin-arm64.tar.gz"
      sha256 "dde8ef59c5caa71989e8e649046835a4fc278643195b4bf466cc63fc06f1e1c9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2599.0.0-linux-x64.tar.gz"
    sha256 "16185ecc1aabedd00051d4c71309dd421bf5a840f9070ca850cfa0022df6c2fd"
  end
  version "2599.0.0"
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
