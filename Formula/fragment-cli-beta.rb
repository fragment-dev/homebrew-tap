require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5440.0.0-darwin-x64.tar.gz"
    sha256 "a6dde08e862f69b35a5ac3d5b4874834b52bf5fd07ed91348b7a0aeadaaa7833"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5440.0.0-darwin-arm64.tar.gz"
      sha256 "b6ace4f6d428f52aa4084d0d12ee441a969f80eab1d11eab22e528d22be56eef"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5440.0.0-linux-x64.tar.gz"
    sha256 "c1207bb917a7b96dbe9108274bbec3d43561691247f0773c167c9b30a51ce173"
  end
  version "5440.0.0"
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
