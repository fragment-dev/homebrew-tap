require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2828.0.0-darwin-x64.tar.gz"
    sha256 "3eebd1089e4fca9f98e3897e4827d0be6f980677df87dd5c29bdad73e958c831"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2828.0.0-darwin-arm64.tar.gz"
      sha256 "f8c2375388b3bda0ff7abc004b7fca2759d851f4f6ae18482109c1c5303b9b2b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2828.0.0-linux-x64.tar.gz"
    sha256 "6196a5bbe085ad4fbf14f460cede4ce1c00cef5c562be58bf80bd7bb8bcf47a6"
  end
  version "2828.0.0"
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
