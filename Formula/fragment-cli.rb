require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.21-1-darwin-x64.tar.gz"
    sha256 "1c761749ec08b19c0271a1b6c4b13db6c9c2cb68a4f8d1807a24f482f3608dd6"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.21-1-darwin-arm64.tar.gz"
      sha256 "177ca7258eb612a85f33eb753903d7cd476105ab6f0825fa02afac00dd9dd223"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.21-1-linux-x64.tar.gz"
    sha256 "c4c6ebc931c673d3cf5db854c8dbec2aa82e598c4e69a40e884bd4cfdc96d6bb"
  end
  version "2024.5.21-1"
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
