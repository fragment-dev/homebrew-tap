require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5960.0.0-darwin-x64.tar.gz"
    sha256 "a99c48582d59d804a3566e4e7f6831292870854f43a7c8b7a0049d077b2e375d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5960.0.0-darwin-arm64.tar.gz"
      sha256 "027b92efd3647cf1d65ffb3092c4a9464d05b7e7b8ab2d7a809e57989e47d65c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5960.0.0-linux-x64.tar.gz"
    sha256 "17acaf431ec9d605a08ac3ecc1fef771bffcfa47769a1ddd04493a50f3d9850a"
  end
  version "5960.0.0"
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
