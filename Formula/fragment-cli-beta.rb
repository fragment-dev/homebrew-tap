require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4781.0.0-darwin-x64.tar.gz"
    sha256 "1573e11ea21649fb52e17a7e0ec9a380a1289d7c00503761d5448423f411d224"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4781.0.0-darwin-arm64.tar.gz"
      sha256 "a05de42e352573c809454a697cb3df6eda02ece05a317e6ffa7d6bcf91f66e06"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4781.0.0-linux-x64.tar.gz"
    sha256 "7d0a3c767f1f7d76b7e5ac2e294c97909d63904420ef716c19f5432be1f1801f"
  end
  version "4781.0.0"
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
