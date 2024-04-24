require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4938.0.0-darwin-x64.tar.gz"
    sha256 "02281f9413b0bd9b4d03df9c481452c0ee21a4a78a49e8dbec97111939dab8a8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4938.0.0-darwin-arm64.tar.gz"
      sha256 "23ff2975bb9efed47a3975d48638baa8eb3857c0dd3faa9ae9c2e9b9d07ae02d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4938.0.0-linux-x64.tar.gz"
    sha256 "68e37be0cae5d7807b269687fd293b10ea619cac059afe519fa4be4c860722c4"
  end
  version "4938.0.0"
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
