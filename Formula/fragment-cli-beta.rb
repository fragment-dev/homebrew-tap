require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5121.0.0-darwin-x64.tar.gz"
    sha256 "ec918ae10f465cdbe5c498fed28f27be053d6d350bb30744372371e389aa6156"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5121.0.0-darwin-arm64.tar.gz"
      sha256 "f7c307d6a375edfbb271581341bf224b5ee4205e326dc6d745a3f5eb22b0a3ac"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5121.0.0-linux-x64.tar.gz"
    sha256 "0b9969bd3b52204255445e339aff1f357926f7bf0d77978d7e09a1ebb7418fbf"
  end
  version "5121.0.0"
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
