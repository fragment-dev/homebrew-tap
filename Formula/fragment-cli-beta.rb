require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5827.0.0-darwin-x64.tar.gz"
    sha256 "d900212cbba172bd5d835d73eed94714ed172e4ea017d4bdffe818d1a53fef19"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5827.0.0-darwin-arm64.tar.gz"
      sha256 "081236fd6cd897ba83398b62eb7189a12951b5240734662692761a4cd1c570a4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5827.0.0-linux-x64.tar.gz"
    sha256 "fd1c12ad2b593eaf75c2ce06d5236aba02cc6c2be1d91c3725805ca30971aa03"
  end
  version "5827.0.0"
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
