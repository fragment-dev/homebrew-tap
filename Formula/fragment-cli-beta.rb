require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2290.0.0-darwin-x64.tar.gz"
    sha256 "fd1ba076cf4b8f09d85de79b7991dab1cde7738830c4570d09d582b3924d63a7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2290.0.0-darwin-arm64.tar.gz"
      sha256 "8500805c7f672b391a3b0016c19e8cf472e7317c58f38765741fdc69c4d3c2a9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2290.0.0-linux-x64.tar.gz"
    sha256 "7f7d46724e624ddc819903187d28af20f2feaf4ecd15c67a4aca01d4d1d5a910"
  end
  version "2290.0.0"
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
