require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4059.0.0-darwin-x64.tar.gz"
    sha256 "5838c5575e20f3b23b9bc4c3c6e3b51c6c03b51da9294f7c68b8038fc8f9d2e1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4059.0.0-darwin-arm64.tar.gz"
      sha256 "668b0d520945cd053e920380ea9355ff1871838b71a023937a046a7e6b5a5ea2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4059.0.0-linux-x64.tar.gz"
    sha256 "d0e9e5af2233295d175dbf142dd40411aaf7177f85469660e4f6b451ed47a529"
  end
  version "4059.0.0"
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
