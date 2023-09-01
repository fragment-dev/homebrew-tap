require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3470.0.0-darwin-x64.tar.gz"
    sha256 "b68d4576d1e65bd90650daa35e56742d51926fa9898f8d600fdf11e308fe2a6e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3470.0.0-darwin-arm64.tar.gz"
      sha256 "ee03d95d4f0a38e08ff5fcc10f7e65443af424084ae6e2d8a1b1e448a13d6149"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3470.0.0-linux-x64.tar.gz"
    sha256 "2c4986591b7b94d8e424afd56743e3f8f058f996d974a8e09e82cc9ab345da5b"
  end
  version "3470.0.0"
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
