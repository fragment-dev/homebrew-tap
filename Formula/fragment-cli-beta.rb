require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4318.0.0-darwin-x64.tar.gz"
    sha256 "62d9378f542f2788e3b13553d32e44bf499f9a6a1f4d842f05dda5b2f44db927"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4318.0.0-darwin-arm64.tar.gz"
      sha256 "eb71690df960504057034e58486f819b8667a8e3ee9b8e61893e7e7dc72121c8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4318.0.0-linux-x64.tar.gz"
    sha256 "c01d357663f98520153ae6b943e093d47f3076a7541b3f0bb9a7a7f5e8d8fbe8"
  end
  version "4318.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
