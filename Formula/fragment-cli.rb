require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.27-darwin-x64.tar.gz"
    sha256 "407de5aaa673f70646079be4227ebd5e0461ecfd802c88adbe6fd71e270748c1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.27-darwin-arm64.tar.gz"
      sha256 "417aa1afe1a61ef0f30913d545772a662cd7515191c3b9ae7159896d0eee679f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.27-linux-x64.tar.gz"
    sha256 "2285c0ab4e9db017bef4996b04d99a9adf20b58c0f4ef25c8a30bc7680522893"
  end
  version "2024.12.27"
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
