require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3399.0.0-darwin-x64.tar.gz"
    sha256 "9b2bfc909fba82f4f1a6b835666dc752893b8813ddafc2d8b9e64c1dbefeef9a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3399.0.0-darwin-arm64.tar.gz"
      sha256 "993158a4b8c0738e6a81deabf104511ee0d1eef8efc5c96e9c88a98017decefb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3399.0.0-linux-x64.tar.gz"
    sha256 "c6d05d0b9bc095becb3e1d590db81285bd1aa2a83134d5c011fd2ec3eb0b6de8"
  end
  version "3399.0.0"
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
