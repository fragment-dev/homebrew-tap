require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3051.0.0-darwin-x64.tar.gz"
    sha256 "09a72404663e1bf20b2245f2609c5e817f8870629075b11bee9e831871aa1765"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3051.0.0-darwin-arm64.tar.gz"
      sha256 "6a6ce1bc8f0ac84e8e3c001ea1f1cc303b9aef397b505bda55c9ba4d803939d8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3051.0.0-linux-x64.tar.gz"
    sha256 "1da5e319ab73a0fcd7c92614eac7d52524c87bfae6a1b0e808a5b6022c5126b0"
  end
  version "3051.0.0"
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
