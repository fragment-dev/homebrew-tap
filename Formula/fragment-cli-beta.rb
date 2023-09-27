require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3681.0.0-darwin-x64.tar.gz"
    sha256 "6feba19aeff04f8c027d137a304f0e710684cc2f9ca72b9916096e98da263699"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3681.0.0-darwin-arm64.tar.gz"
      sha256 "bfd4314ff2324d33c6faa85d9a46a87a88b2aceb55eba15bf3d4ac51febf8775"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3681.0.0-linux-x64.tar.gz"
    sha256 "e0742207e81afe1d1e20cc3d2e8c43376bc8577991b222546f79fa319a77476a"
  end
  version "3681.0.0"
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
