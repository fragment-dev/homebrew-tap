require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2932.0.0-darwin-x64.tar.gz"
    sha256 "92f64cb17f211586a31b02dee1db464c3e1002ab79246d5bc7f36cf6f2f2fdb8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2932.0.0-darwin-arm64.tar.gz"
      sha256 "f3a6526a23cc05185210a9f467b6cdb5fac5d88dc4056c69fe2ed7a918079e74"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2932.0.0-linux-x64.tar.gz"
    sha256 "6ec02dc25838400928493295f603d993adbd8a69a40fdaf41221cf26241c11be"
  end
  version "2932.0.0"
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
