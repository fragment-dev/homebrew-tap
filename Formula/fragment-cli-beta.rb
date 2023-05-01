require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2557.0.0-darwin-x64.tar.gz"
    sha256 "1cb84b2f68a02e99d5a724c22ec642308493def5324a76f0669abcc2e3ac3b80"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2557.0.0-darwin-arm64.tar.gz"
      sha256 "0174a42deda4dc636529c83a4228b8ca307117e7c6fb426aff47aa7618f2d9c5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2557.0.0-linux-x64.tar.gz"
    sha256 "660a9fda2da1d2b125040c85d97706e48ebfde54d3347f05760490a38653ac42"
  end
  version "2557.0.0"
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
