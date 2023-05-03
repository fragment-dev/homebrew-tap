require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2574.0.0-darwin-x64.tar.gz"
    sha256 "ca2e7badc6db90092071984800dfd3539b328182ee0145da96cfab7e285e6a39"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2574.0.0-darwin-arm64.tar.gz"
      sha256 "0ba398c7c679117828f0dccdf7eb97f42bac1e4d9761119a3a40df7df36efc29"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2574.0.0-linux-x64.tar.gz"
    sha256 "a062578133c650de2dda8b1ec0857c31d84f5be33f3ee56089b386d84e28bade"
  end
  version "2574.0.0"
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
