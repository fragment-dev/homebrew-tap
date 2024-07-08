require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5355.0.0-darwin-x64.tar.gz"
    sha256 "1a2d5e1b60f591771163cba1877176796f9054204d03feb1ff178112eeb7a6b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5355.0.0-darwin-arm64.tar.gz"
      sha256 "8b377ede7eeb40f4f3fded69893b1d8043c3031e2d5d37f305c8f1c8e558c5ea"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5355.0.0-linux-x64.tar.gz"
    sha256 "62496d1b1ab27f1c089c8148e0575d1a6b7a6673eaf9d4c2431dccee6eae9f9e"
  end
  version "5355.0.0"
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
