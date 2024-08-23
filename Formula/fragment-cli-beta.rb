require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5535.0.0-darwin-x64.tar.gz"
    sha256 "632b0a027c11b7db3faa6aa20cf4da08ae0adfb8f3c1a18284334bd697f7f334"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5535.0.0-darwin-arm64.tar.gz"
      sha256 "f0560d7cb00bd6722c4fa6d6eacb218abf79812cb96da2c4eb7efb34044d09dd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5535.0.0-linux-x64.tar.gz"
    sha256 "4cc70250255265a40bb7ae0738bad6e872f17ba7653034b8a401fb5d3d552070"
  end
  version "5535.0.0"
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
