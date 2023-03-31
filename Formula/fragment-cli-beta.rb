require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2332.0.0-darwin-x64.tar.gz"
    sha256 "aa563598fe67cb6c1bbae06673c5769c104e88f69bf90766f3cc068c291d625b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2332.0.0-darwin-arm64.tar.gz"
      sha256 "3fe139dd3d96d0dd5bbe2fdaafd259fc531eecaf63d59c6f650f6cb66c81b690"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2332.0.0-linux-x64.tar.gz"
    sha256 "1ad1b999bcb3985cff81b62879006d3305c3d2a8fb67db34c1cfc5845e5ac1e7"
  end
  version "2332.0.0"
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
