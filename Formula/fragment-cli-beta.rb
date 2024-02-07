require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4515.0.0-darwin-x64.tar.gz"
    sha256 "b222eff5bf3fc32e1a282f06f4565809becbc5202f7a1c781f34d8501c895d28"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4515.0.0-darwin-arm64.tar.gz"
      sha256 "04ee1002aad8bc1927d9dd4f16e3e80e2b3941abf2d3438198096584a5914fc8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4515.0.0-linux-x64.tar.gz"
    sha256 "d3ebc52b6ae52b33a445660554ade1551db8362496b9c7033e68ed3f90315e68"
  end
  version "4515.0.0"
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
