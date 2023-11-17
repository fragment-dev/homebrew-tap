require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4022.0.0-darwin-x64.tar.gz"
    sha256 "5516910472924f1cbe04e268cc57258d4f17e4b28739dd5bbfa3ba49abd249e4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4022.0.0-darwin-arm64.tar.gz"
      sha256 "e7ceedca3cce21e3f95781371798e53d412858909af9b9e3d45127e8e2be8563"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4022.0.0-linux-x64.tar.gz"
    sha256 "3b23d37bfa5aab6a29e34256ddf9d654cbd5a2bf21a0411789d7e0d90d5c52e0"
  end
  version "4022.0.0"
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
