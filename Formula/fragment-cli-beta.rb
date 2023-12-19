require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4169.0.0-darwin-x64.tar.gz"
    sha256 "08847b6fd94a0e4dc107b857f60c23b6bd0c1ab5c90747a59b15a333781d8848"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4169.0.0-darwin-arm64.tar.gz"
      sha256 "a9a5d6cdd1497b461d7d888808c31e0445e3565f8658b7aa3b8b2d3b31c6dad7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4169.0.0-linux-x64.tar.gz"
    sha256 "4a371e647464767e84af927ca2f38421dd28e7260b14609586e1e46ad43f76b5"
  end
  version "4169.0.0"
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
